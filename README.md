<h1>YMChannelSwitching</h1>
<ul>
<li>两种方式集成</li>
<li>方式一：直接将频道视图以及cell视图添加到你想添加的视图上面，那么只需要将YMChannelSwitching添加到视图上面即可</li>
<li>方式二：如果你想将频道视图添加到navigationItem上，那么请单独添加属性：ym_channersView和ym_collectionView(frame需要单独设置)</li>
<li>初始化方法参数介绍：fram、代理控制器、频道的字符串数组，之后请根据字符串标识注册cell</li>
<li>协议：YMChannelSwitchingDelegate 代理方法(在这里你直接看成返回cell的数据源方法即可)，你可以在代理方法返回不同标识的cell</li>
<li>具体请下载参考示例程序</li>
<a href="https://github.com/iosdeveloperSVIP/YMChannelSwitching/archive/master.zip" target="_blank" ><img src="https://raw.githubusercontent.com/iosdeveloperSVIP/YMChannelSwitching/master/ymchannelswitching.gif"></img></a>
</ul>
<p>GitHub：<a href="https://github.com/iosdeveloperSVIP"  target="_blank">iosdeveloperSVIP</a>
 &nbsp;&nbsp;&nbsp;&nbsp;邮箱：<a href="mailto:iosdeveloper@vip.163.com">iosdeveloper@vip.163.com</a><p>
<h4>亲爱的各位同行，如果在使用中出现bug，请联系邮箱:<a href="mailto:iosdeveloper@vip.163.com">iosdeveloper@vip.163.com</a>，如果使用不错的话请帮我点下右上角星星UnStar，非常感谢</h4>
<h1>操作目录</h1>
<ul>
<li><a href="#defaultstyles">默认方式1:频道和cell直接添加到视图</a>
</li>
<li><a href="#styles2">方式2:频道视图添加navigationItem上</a>
<ul>
<li><a href="#styles2">重新设置ym_collectionView的frame</a></li>
</ul>
</li>
<li><a href="#extensionstyles">扩展样式</a>
<ul>
<li><a href="#extensionstyles">设置当前频道的字体颜色</a></li>
<li><a href="#extensionstyles">设置频道视图</a></li>
<li><a href="#extensionstyles">设置ym_collectionView视图</a></li>
</ul>
</li>
</ul>
<hr/>
<h2>安装使用</h2>
<h3>使用 CocoaPods安装</h3>
<div class="highlight highlight-source-ruby"><pre>pod <span class="pl-s"><span class="pl-pds">'</span>YMChannelSwitching<span class="pl-pds">'</span></span></pre></div>
<h3>手动导入文件</h3>
<ul>
<li>将YMChannelSwitching文件夹中的所有源代码拽入项目中</li>
<li>【导入主头文件：<code>#import "YMChannelSwitching.h"</code>】</li>
</ul>
<h2 id="defaultstyles">默认方式1:频道和cell直接添加到视图</h2>
<div class="highlight highlight-source-objc"><pre>
<span class="pl-k">
YMChannelSwitching *channerView = [[YMChannelSwitching alloc] 
<br>initWithFrame:CGRectMake(0, 0, self.ym_width,self.ym_height * 0.5) Delegate:self channers:_channels];
<br>[channerView.ym_collectionView registerClass:[YMCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
<br>[self.contentView addSubview:channerView];
<br>YMChannelSwitchingDelegate //请遵守协议
<br>-(UICollectionViewCell *)ymcollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
<br>//请实现代理方法、当做返回cell的数据源方法操作</span></pre></div>
<h2 id="styles2">方式2:频道视图添加navigationItem上</h2>
<div class="highlight highlight-source-objc"><pre>
<span class="pl-k">
YMChannelSwitching *channerView = [[YMChannelSwitching alloc] 
<br>initWithFrame:CGRectMake(0, 64, self.view.ym_width,self.view.ym_height - 64) Delegate:self channers:_channels];
<br>[channerView.ym_collectionView registerClass:[YMCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
<br>[self.view addSubview:channerView];
<br>self.navigationItem.titleView = channerView.ym_channersView;
<br>channerView.ym_collectionView.frame = CGRectMake(0, 64, self.view.ym_width, self.view.ym_height - 64);
<br>[self.view addSubview:channerView.ym_collectionView];</span></pre></div>
<br>请实现代理方法，同上
<h2 id="extensionstyles">扩展样式</h2>
<div class="highlight highlight-source-objc"><pre>
<span class="pl-k">//设置当前频道的字体颜色
<br>[channerView ym_setChannelColorWithRed:0.0 green:0.0 blue:0.0];
<br>//设置频道视图
<br>channerView.ym_channersView.frame = CGRectMake(0, 50, 300, 50);//还有其他UIScrollView属性可扩展
<br>//设置ym_collectionView视图
<br>channerView.ym_collectionView.frame = CGRectMake(0, 50, 300, 300);//其他UICollectionView属性也可以扩展</span></pre></div>
<h4>亲爱的各位同行，如果你已经浏览到这，请帮我点下右上角星星UnStar，非常感谢</h4>
