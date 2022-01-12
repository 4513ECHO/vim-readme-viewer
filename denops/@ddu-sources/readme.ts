import { BaseSource } from "https://pax.deno.dev/Shougo/ddu.vim/denops/ddu/types.ts";
import type { Item } from "https://pax.deno.dev/Shougo/ddu.vim/denops/ddu/types.ts";
import type { GatherArguments } from "https://pax.deno.dev/Shougo/ddu.vim/denops/ddu/base/source.ts";
import type { Denops } from "https://deno.land/x/denops_std@v1.11.3/mod.ts";
import { ensureObject } from "https://deno.land/x/unknownutil@v0.1.1/mod.ts";

interface ActionData {
  name: string;
}

type Params = Record<never, never>;

interface PluginData {
  path: string;
  name: string;
}

export class Source extends BaseSource<Params, ActionData> {
  kind = "readme";

  gather(args: GatherArguments<Params>): ReadableStream<Item<ActionData>[]> {
    return new ReadableStream({
      async start(controller) {
        const list = async (): Promise<Item<ActionData>[]> => {
          const plugins = await args.denops.call("readme_viewer#get");
          ensureObject<PluginData>(plugins);
          return Object.values(plugins).map((i) => {
            return {
              word: i.name,
              action: {
                name: i.name,
              },
            };
          });
        };
        controller.enqueue(
          await list(),
        );
        controller.close();
      },
    });
  }

  params(): Params {
    return {};
  }
}
