# 各種設定ファイル

    $ cd ~/
    $ git clone git@210.131.249.250:murayama/dotfiles.git    

ホームディレクトリに使いたい設定ファイルをコピーするか、シンボリックリンクをはるかしてください

## .vimrc

プラグイン管理にvundleを使用します。
vundleはsubmoduleとして運用します。  

vundleを有効にします  
    
    $ cd dotfiles
    $ git submodule init
    $ git submodule update
    $ cd .vim/vundle.git
    $ git checkout master

.vimrcと.vimにシンボリックリンクをはります

    $ cd ~/
    $ ln -s dotfiles/.vimrc .vimrc
    $ ln -s dotfiles/.vim .vim

スワップファイルを~/tmpに作る設定になっているので、なければ作ります

    $ mkdir ~/tmp

プラグインをインストールします
.vimrcを開いたらBundleInstallコマンドを実行してください

    $ vi .vimrc

このとき、エラーが出てプラグインがインストールできない場合は、.gitconfigに

```
[http]
  sslVeryfy = false
```

を設定してから試してください。

<!-- javascript.vimの改行コードがdosになっていてエラーがでるかもしれないので、その場合は、改行コードをunixにかえてください --> 

vimprocをコンパイルします  

```
$ cd .vim/bundle/vimproc
$ make -f make_unix.mak
```

成功したらvimproc/autoload/vimproc_unix.soができます。  
macの場合は、make_mac.makを使ってコンパイルしてください。  

syntasiticプラグインが入っているので、javascriptのシンタックスチェックを行いたい場合は、node.jsのjshintをインストールする必要があります  
jslintでもかまいませんが、チェックが厳しいのでjshintを使っています

```
$ npm install -g jshint
```
