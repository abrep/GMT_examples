### GMT示例集

[![Build Status](https://travis-ci.org/gmt-china/GMT_examples.svg?branch=gh-pages)](https://travis-ci.org/gmt-china/GMT_examples)
[![License (CC BY-NC 4.0 CN)](https://img.shields.io/badge/license-CC%20BY--NC%204.0-red.svg)](http://creativecommons.org/licenses/by-nc/4.0/)

该网站由Jekyll生成，使用了brume作为主题，项目托管在GitHub上。

将源码托管到项目的 `gh-pages` 分支，则GitHub会自动将其转换成网页。

#### 对于示例的说明

1. 每一个示例必须放在单独的文件夹下，且按照 `exnnn` 的格式命令并编号。
2. 在`_posts`目录下新建文件`YYYY-MM-DD-exnnn.md`，并参考模板写文档
3. 由于Jekyll自身的限制，必须将绘图脚本复制一份到 `_includes` 目录下
4. `update_example.py` 会自动检测是否需要重新运行示例

#### 许可协议

本作品采用 [知识共享署名-非商业性使用 4.0 国际许可协议](http://creativecommons.org/licenses/by-nc/4.0/) 进行许可。任何人都可以自由地分享、修改本作品，但必须遵循如下条件：

- 署名：必须提到原作者，提供指向此许可协议的链接，表明是否有做修改
- 非商业性使用：不能对本作品进行任何形式的商业性使用
