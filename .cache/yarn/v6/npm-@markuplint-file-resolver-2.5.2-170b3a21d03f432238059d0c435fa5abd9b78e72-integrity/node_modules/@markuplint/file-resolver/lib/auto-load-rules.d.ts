import type { Ruleset, AnyMLRule } from '@markuplint/ml-core';
/**
 * @deprecated
 */
export declare function autoLoadRules(ruleset: Ruleset): Promise<{
    rules: AnyMLRule[];
    errors: unknown[];
}>;
