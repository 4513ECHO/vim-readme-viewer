import type { Denops } from "https://deno.land/x/denops_std@v1.11.3/mod.ts";
import type { GatherArguments } from "https://pax.deno.dev/Shougo/ddu.vim@492abe0/denops/ddu/base/source.ts";
import type { Item } from "https://pax.deno.dev/Shougo/ddu.vim@492abe0/denops/ddu/types.ts";
import { BaseSource } from "https://pax.deno.dev/Shougo/ddu.vim@492abe0/denops/ddu/types.ts";
import { ensureObject } from "https://deno.land/x/unknownutil@v0.1.1/mod.ts";
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
