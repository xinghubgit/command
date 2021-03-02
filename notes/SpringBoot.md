

// https://docs.oracle.com/javase/8/docs/technotes/guides/management/jconsole.html
// jconsole: code Cache (non-heap): The HotSpot Java VM also includes a code cache, containing memory that is used for compilation and storage of native code.

Integer.valueOf()
//方法基于减少对象创建次数和节省内存的考虑，【-128，127】之间的数字会被缓存


        ARM Automatic Resource Management


//Mybatis
        mybatis.type-aliases-package=com.example.domain.model
        mybatis.type-handlers-package=com.example.typehandler
        mybatis.configuration.map-underscore-to-camel-case=true
        mybatis.configuration.default-fetch-size=100
        mybatis.configuration.default-statement-timeout=30

        Interceptor => Audit
        TypeHandler
        DatabaseIdProvider
        LanguageDriver

        AbstractRoutingDataSource



@Value("#{systemProperties['os.name'].indexOf('Win') >= 0 ? 'csv' : '${csv.file.path}'}")

WebServiceFactoryCustomizer
        FailureAnalysisReporter
        SpringApplicationBuilder
//SpringFramework手动装配
//Spring模式注解装配（应用中扮演"组件"角色的注解）(stereotype Annotations)
//@Component @Service @Configuration
        WebExceptionHandler
        HandlerExceptionResolver

@Enable
//具备相同领域的功能组件集合，组合所形成的一个独立的单元
//@EnableWebMvc @EnableAutoConfiguration
//实现：注解方式，编程方式


//Spring条件装配
//@Profile @Conditional
//实现：注解方式，编程方式;范式注解


//SpringBoot 自动装配
//定义：基于约定大于配置的原则，实现spring组件自动装配的目的
//装配：模式注解，@Enable 模块， 条件装配，工厂加载机制
//实现：激活自动装配 @EnableAutoConfiguration，实现自动装配 XXXAutoConfiguration，配置自动装配auoto-config/ META-INF/spring.factories

SpringFactoryLoader
        BeanDefinitionLoader

//SpringBoot Application 调整方法：1.通过new SpringBootApplication 2.通过new SpringApplicationBuilder
//SpringBoot 加载，1.应用上下文初始器和应用事件监听器


//SpringApplication 运行阶段
//加载：SpringApplication 运行监听器
//运行：SpringApplication 运行监听器
//监听：Spring Boot事件 Spring事件

//创建：应用上下文，Environment
//失败：故障分析报告
//回调：CommandLineRunner ApplicationRunner

//run阶段
        ConfigurableApplicationContext
        SpringBootExceptionReporter
        SpringApplicationRunListeners


        BeanPostProcessor
        EnvironmentPostProcessor

        SpringApplicationRunListener //Listener for SpringApplication run method.
        SpringFactoryLoader
        EventPublishingRunListener
        StopWatch

//ConfigurableApplicationContext
        AnnotationConfigApplicationContext
        AnnotationConfigServletWebServerApplicationContext
        AnnotationConfigReactiveWebServerApplicationContext



//Servlet职责：处理请求；资源管理；视图渲染
//SpringMVC时代：实现Controller;配置web mvc组件；部署DispatcherServlet
        RequestMappingHandlerMapping
        RequestMappingHandlerAdapter
        InternalResourceViewResolver


        HandlerMapping
        HandlerAdapter
        HandlerExecutionChain
        ViewResolver
        LocaleResolver LocaleContextResolver
        ThemeResolver

@ModelAttribute
@RequestHeader
@Valid
@Validated
@ExceptionHandler
@ControllerAdvice

//完全的自动装配
//条件装配
//外部化配置





DataSource.java
        DataSourceProperties.java
        DataSourceFactory.java => interface
DataSourceAutoConfigration.java
        SqlSessionFactory.java => interface
DefaultSqlSessionFactory.java
        SqlSessionManager.java
        SqlSession.java => interface
DefaultSqlSession.java
        SqlSessionTemplate.java



        RedisProperties.java
        RedisAutoConfiguration.java
        RedisConnectionFactory.java => interface
JedisConnectionFactory.java
        LettuceConnectionFactory.java
        RedisConnection.java => interface
LettuceConnection.java
        RedisClient.java
        RedisOperations.java => interface
RedisTemplate.java


        MongoProperties
        MongoAutoConfiguration.java
        MongoClientFactory.java
        MongoClient.java
        MongoCLientOptions.java
        MongoTemplate.java




AbstractApplicationContext.java => refresh()
invokeBeanFactoryPostProcessor(beanFactory)
双亲委派的优势：
1.避免类的重复加载
2.核心api中定义的类型不会被任意替换
3.AOP把软件系统分为两个部分：核心关注点和横切关注点
4.AOP的实现：①动态代理技术，采用截取信息的方式，对改信息进行装饰

分布式架构的理论：
1. 一致性(Consistency)；所有节点在同一个时间具有相同的数据
2. 可用性(Avalilability) ；保证每个请求不管公共或者失败都有相应
3. 分割容忍(Partition tolerance)：系统中任意信息的丢失或者失败不会影响系统的继续运行





