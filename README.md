
# 簡易計算機真的很簡易？
今天看到坐在旁邊的Ray在做計算機，就跟著做起來了 🤣，當下看一下邏輯，感覺好像滿簡單的，實際製作過，才知道困難的點😱。
給大家看看我當初的思路。
![](https://i.imgur.com/odTmAx3.jpg)
> 只要text或是buffer是空的，就不運算。


當然，這種純純的思路是完全經不起考驗的😭。
這是製作過程中期的思路。
![](https://i.imgur.com/T3DdLTv.jpg)
> 中期規劃的UML
> 
當然，很多細節沒有考慮到，所以他不完全是對的😢。
所以這次要記錄的是，如何在開始寫code前，有效減少debug所花的時間。


---

## UML規劃
簡單釐清自己的UML(上面那張)，然後實際走過為debug設計的問題。
![](https://i.imgur.com/4sMIk5U.jpg)
>按照UML，把用到的變數，堆疊實際走過。

![](https://i.imgur.com/iX7NIx1.jpg)
設計問題，就會發現一些需要注意的細節。
![](https://i.imgur.com/0JTIuAm.png)
當UML修改完成之後，才開始編碼。
## 測試工具
如果要debug，單元測試是個很實用的工具。
![](https://i.imgur.com/9HNnUSq.png)
Unit Test Case
![](https://i.imgur.com/FDKXWAK.png)
左邊的funtion，可以測試右側的編碼。

---

## 介面設計
我的習慣是，先搭建一個可以提供測試的平台，該有的功能實現完了，才會開始製作介面。當然你也可以先製作介面，再製作功能，因人而異的😅。照自己習慣的方式設計吧 🤗。
把Button跟Label拉進去，至於怎麼拉，因為前面的文章有教過了，就先跳過啦。
![](https://i.imgur.com/okT2Vu4.png)

