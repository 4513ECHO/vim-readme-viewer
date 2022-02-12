import type { ActionArguments } from "https://deno.land/x/ddu_vim@v0.12.2/base/kind.ts";
import {
  ActionFlags,
  BaseKind,
} from "https://deno.land/x/ddu_vim@v0.12.2/types.ts";

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
