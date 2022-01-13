import { BaseKind } from "https://pax.deno.dev/Shougo/ddu.vim/denops/ddu/types.ts";
import type { Denops } from "https://deno.land/x/denops_std@v1.11.3/mod.ts";
import type { ActionArguments } from "https://pax.deno.dev/Shougo/ddu.vim/denops/ddu/base/kind.ts";

interface ActionData {
  name: string;
}

type Params = Record<never, never>;

export class Kind extends BaseKind<Params, ActionData> {
  actions: Record<string, (args: ActionArguments<Params>) => Promise<void>> = {
    open: async (args) => {
      for (const item of args.items) {
        const action = item?.action as ActionData;
        const name = action.name;
        await args.denops.call("readme_viewer#open", name, "");
      }
    },
  };

  params(): Params {
    return {};
  }
}
