# 超市管理系统项目
## 项目背景

随着现代科学技术的迅猛发展，计算机技术已经渗透到各个领域，成为各行业必不可少的工具，特别是Internet技术的推广和信息高速公路的建立，使IT产业在市场竞争中越发显示出其独特的优势，步入信息化时代，有巨大的数据信息等待加工处理和传输，这使得对数据库的进一步开发和利用显得尤为迫切。

为了适应日趋激烈的市场竞争，各类型的超市需要对自身的经营状况有充分的了解，并通过有效的管理不断提高效率。为此，超市管理系统便显得尤为重要了，依靠现代化的计算机信息处理技术来管理超市，是对超市整体信息的管理成为提高经营效率的一个重要途径。

我使用MyEclipse、SQL Server、DreamWeaver等软件来对系统进行开发，分别进行前端设计、数据库表的创建设计、存储过程的编写、以及selvlet实现的工作。

## 项目总结

对项目的总体评价：

截至至项目交付日期，项目的主要内容已经基本完成。超市经理、收银员、仓管员、管理员和顾客都能正常进行操作。由于时间仓促，我们小组未没有完成商城页面的代码编写工作，只做出了商城的网页页面。

**完成了项目的功能:**

超市经理能够对商品进行增删改查操作;能够对员工进行增删改查操作;

收银员能够对商品进行出售和统计。

仓管员可以对库存商品进行增删改查操作。

顾客可以注册账号，进行积分等级查询，以及个人密码的修改。

管理员可以进行用户信息的增删改。

管理员可以对管理员账号进行管理。

积分系统，可以积分查询，会员等级查询，修改会员积分。 

所有用户均可以对自己的信息进行修改。

组别管理中，组别的增删改查，组别的赋予和撤销。

**可完善的项目功能:**

忘记密码,商城系统的开发,购物车等功能的实现。

权限管理，数据库和页面均以在管理员界面设计出来，但是时间实在太近，工程量太大，完成后，可以直接从数据库根据每个组别给予不同权限，根据权限分配的组别，组别可以对应在页面操作相应的操作，完全实现动态和重用性，符合正常使用的严格需求。

**技术总结:**

采用`HTML5`+`CSS3`+`JSP`技术进行整体的系统开发，其中采用MVC架构进行开发，所有SQL语句均采用存储过程的方式实现，保证其安全性。

前端采用了`layui`和`bootstrap`框架，使用`ajax`进行表单提交和正则表达式进行表单验证。

项目采用`Sql server2014`,`My Eclipse8.6`,`Dreamweaver`等软件进行开发。

通过使用`Js`,`Jquery`实现了实时显示当前时间的时钟，分页，背景轮换等。

表的设计严格按照人员，权限，资源以及映射表的形式创建，使用这种数据库设计方式搭建起来的系统是可以重用的。

- **三张实体表中记录着系统中的三个决定性元素**。“权限”，“组”和“人”。而这三种元素可以任意添加，彼此之间不受影响。无论是那种类型的业务系统，这三个决定性元素是不会变的，也就意味着结构上不会变，而变的仅仅是数据。
- **两张映射表中记录着三个元素之间的关系**。但这些关系完全是人为创建的，需要变化的时候，只是对数据库中的记录进行操作，无需改动结构。
- **权限分栏表中记录着系统使用时显示的分栏**。无论是要添加分栏，修改分栏还是减少分栏，也只不过是操作记录而已。

　　综上所述，这样设计数据库，系统是完全可以重用的，并且经受得住“变更”考验的。

**总结：**

　　此套系统的重点在于，三张**实体表**牢牢地抓住了系统的核心成分，而两张映射表完美地映射出三张实体表之间的交互。其难点在于，理解映射表的工作，它记录着关系，并且实现了组操作的概念。而系统总体的设计是本着可以在不同的系统中重用来满足不同系统的功能权限设置。

## 使用方法和介绍

这个项目是2018年末完成的，学校作业的项目，项目开始进度是符合计划的，但是由于课程繁重，我也并不熟练，再加上系统设计架构工作量特别大，导致编码工作时间极长，但是毕竟这只是一个样子工程，时间极少，只需要实现基本功能，不用考虑其真正运营时的合理性，已经设计好的内容和板块设计，在此次作业就无需全部完成，所以并没有完成权限管理的设计，以至总体时间还是和计划相同的，真是可喜可贺啊。

多花时间的工作应该是后台，而不是前端的页面设计是否符合美感，和控件的放置位置，但是由于强迫症，还是花费了极多的时间，去调整位置。

编码环节时间加长，测试、验收环节向后延期。

------

### 使用方法

`SMMS`为数据库文件，导入`sql server2014`数据库中。如果不能直接导入，则添加后缀名`*.bak`，再进行导入即可。

项目文件夹`SupermarketMS`，使用`MyEclipse`进行导入即可。

**可以改进的地方**

前面的总结中有说到，但是这边技术其实挺普通的，可以改进下前端框架和后端框架的使用。例如，现在比较热门的`VUE`前端框架，以及后端可以使用`Spirng boot`开发，还是比较简单的，相比较与`SSM`框架，省略了很多配置项。我这边项目并没有使用后端框架，就是原生的`MVC`架构。
