@Id

@Column(
    name="columnName";
    boolean unique() default false;
    boolean nullable() default true;
    boolean insertable() default true;
    boolean updatable() default true;
    String columnDefinition() default "";
    String table() default "";
    int length() default 255;
    int precision() default 0; // decimal precision
    int scale() default 0; // decimal scale

@GeneratedValue(generator = "system-uuid")   
@GenericGenerator(name = "system-uuid", strategy = "uuid.hex")   // uuid
	
//    @GeneratedValue(strategy=GenerationType.AUTO)  // 自动增长 

@Transactional(readOnly = false) // 
public class DocCommentDaoImpl  : 解决 read only 

@Entity //标示为实体
@Table(name="oa_m_userrole")// 指示表名
@IdClass(OA_M_Userrole_PK.class)//标示用中间表,





将一个Bean声明为实体类

@Entity

@Column常用属性：

@Column(
    name="columnName";
    boolean unique() default false;
    boolean nullable() default true;
    boolean insertable() default true;
    boolean updatable() default true;
    String columnDefinition() default "";
    String table() default "";
    int length() default 255;
    int precision() default 0; // decimal precision
    int scale() default 0; // decimal scale


为实体类添加乐观锁

@Entity

public class Flight implements Serializable {

...

     @Version

     @Column(name="OPTLOCK")

    public Integer getVersion() { ... }

}

@Transient


瞬时的，非持久化的属性


 


@Basic


所有不添加注解的实体类的属性默认都为@Basic，可以设置该属性的抓取策略


@Basic(fetch = FetchType.***)


 


@Temporal


时间的，以DATE, TIME, or TIMESTAMP为类型的属性，


 


@Lob


标注该属性应为Blob或者Clob类型的，Blob为二进制内容，通常为图片等，Clob为大文本内容。


 


@Embedded


嵌入式的，把一个非实体Bean作为一个实体类的属性，该非实体Bean必须添加注解为

@Embeddable


可以用@AttributeOverrides注解重写关联的字段名，ex：


@Embedded
@AttributeOverrides( {

              @AttributeOverride(name="iso2", column = @Column(name="bornIso2") ),

              @AttributeOverride(name="name", column = @Column(name="bornCountryName") )

    } )


 


 


@Embedded

      @AttributeOverrides( {

              @AttributeOverride(name="city", column = @Column(name="fld_city") ),

              @AttributeOverride(name="nationality.iso2", column = @Column(name="nat_Iso2") ),

              @AttributeOverride(name="nationality.name", column = @Column(name="nat_CountryName") )

            //nationality columns in homeAddress are overridden

    } )

    Address homeAddress;



 


@Id为实体添加标识列


@Id @GeneratedValue添加标识生成的策略，默认为GenerationType.AUTO，相当于xml的native


否则，需要手动添加标识列的值。


 


为实体类定义一个序列生成器，可以将该序列生成器产生的值作为@GeneratedValue：


@Entity

@javax.persistence.SequenceGenerator(

      name="SEQ_STORE",

      sequenceName="my_sequence"

)

public class Store implements Serializable {

    private Long id;


      @Id @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="SEQ_STORE")

    public Long getId() { return id; }

}


 


外键的生成：


@Entity

class MedicalHistory implements Serializable {

    @Id @OneToOne

    @JoinColumn(name = "person_id")

  Person patient;

}


@Entity

public class Person implements Serializable {

    @Id @GeneratedValue Integer id;

}




















	