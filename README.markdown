# 各種設定ファイル

    $ cd ~/
    $ git clone git@github.com:murayama/dotfiles.git    

ホームディレクトリに使いたい設定ファイルをコピーするか、シンボリックリンクをはるかしてください

## .vimrc

プラグイン管理にdein.vimを使用します。

.vimrcと.vimにシンボリックリンクをはります

    $ cd ~/
    $ ln -s dotfiles/.vimrc .vimrc
    $ ln -s dotfiles/.vim .vim

スワップファイルを~/tmpに作る設定になっているので、なければ作ります

    $ mkdir ~/tmp

syntasiticプラグインが入っているので、javascriptのシンタックスチェックを行いたい場合は、node.jsのjshintをインストールする必要があります  
jslintでもかまいませんが、チェックが厳しいのでjshintを使っています

```
$ npm install -g jshint
```

