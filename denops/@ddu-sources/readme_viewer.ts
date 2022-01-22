import type { GatherArguments } from "https://deno.land/x/ddu_vim@v0.2.0/base/source.ts";
import type { Item } from "https://deno.land/x/ddu_vim@v0.2.0/types.ts";
import { BaseSource } from "https://deno.land/x/ddu_vim@v0.2.0/types.ts";
import { ensureObject } from "https://deno.land/x/unknownutil@v1.1.4/mod.ts";
import type { ActionData } from "../@ddu-kinds/readme_viewer.ts";

type Params = Record<never, never>;

interface PluginData {
  path: string;
  name: string;
}

export class Source extends BaseSource<Params, ActionData> {
  kind = "readme_viewer";

  gather(args: GatherArguments<Params>): ReadableStream<Item<ActionData>[]> {
    return new ReadableStream({
      async start(controller) {
        const plugins = await args.denops.call("readme_viewer#get");
        ensureObject<PluginData>(plugins);
        controller.enqueue(
          Object.values(plugins).map((i) => {
            return {
              word: i.name,
              action: {
                name: i.name,
              },
            } as Item<ActionData>;
          }),
        );
        controller.close();
      },
    });
  }

  params(): Params {
    return {};
  }
}
