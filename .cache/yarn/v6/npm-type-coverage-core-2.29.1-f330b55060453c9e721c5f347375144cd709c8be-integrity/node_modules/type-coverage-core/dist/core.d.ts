import * as ts from 'typescript';
import { AnyInfo, LintOptions, FileTypeCheckResult } from './interfaces';
/**
 * @public
 */
export declare function lint(project: string, options?: Partial<LintOptions>): Promise<{
    correctCount: number;
    totalCount: number;
    anys: AnyInfo[];
    program: ts.Program;
    fileCounts: Map<string, Pick<FileTypeCheckResult, "correctCount" | "totalCount">>;
}>;
/**
 * @public
 */
export declare function lintSync(compilerOptions: ts.CompilerOptions, rootNames: string[], options?: Partial<LintOptions>): {
    correctCount: number;
    totalCount: number;
    anys: (AnyInfo & {
        sourceFile: ts.SourceFile;
    })[];
    program: ts.Program;
    fileCounts: Map<string, Pick<FileTypeCheckResult, "correctCount" | "totalCount">>;
};
