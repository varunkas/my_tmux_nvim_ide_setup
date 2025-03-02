return {
  default_config = {
    cmd = {
      'java',
      '-jar',
      '/Applications/nextflow-language-server/build/libs/language-server-all.jar'
    },
    filetypes = { 'nextflow' },
    root_dir = vim.fs.root(0, "nextflow.config"),
    single_file_support = true,
    settings = {
      nextflow = {
        files = {
          exclude = { ".git", ".nf-test", "work" },
        },
      },
    }
  },
  docs = {
    description = [[
https://github.com/nextflow-io/language-server

Requirements:
 - Linux/macOS (for now)
 - Java 17+

`nextflow_ls` can be installed by following the instructions [here](https://github.com/nextflow-io/language-server).

If you have installed groovy language server, you can set the `cmd` custom path as follow:
]],
  },
}
