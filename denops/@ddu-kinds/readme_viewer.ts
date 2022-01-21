import type { ActionArguments } from "https://pax.deno.dev/Shougo/ddu.vim@492abe0/denops/ddu/base/kind.ts";
import type { Denops } from "https://deno.land/x/denops_std@v1.11.3/mod.ts";
import {
  ActionFlags,
  BaseKind,
} from "https://pax.deno.dev/Shougo/ddu.vim@492abe0/denops/ddu/types.ts";

export interface ActionData {
  name: string;
}

type Params = Record<never, never>;

export class Kind extends BaseKind<Params> {
  actions: Record<
    string,
    (args: ActionArguments<Params>) => Promise<ActionFlags>
  > = {
    open: async (args) => {
      for (const item of args.items) {
        const action = item?.action as ActionData;
        const name = action.name;
        await args.denops.call("readme_viewer#open", name, "");
      }

      return Promise.resolve(ActionFlags.None);
    },
  };

  params(): Params {
    return {};
  }
}
