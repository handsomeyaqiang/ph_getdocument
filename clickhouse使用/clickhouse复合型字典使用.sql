CREATE DICTIONARY d_dim_org_inf_dict (
  GROUP_ID UInt64,
  GROUP_NAME String,
  STORE_ID Int32,\
  STORE_NAME String,
  CITY_ID Int32,
  CITY_NAME String,
  AREA_ID Int32,
  AREA_NAME String,
  org_id Int32,
  org_name String,
  BRANCH_NAME String,
  branch_id Int32,
  BRANCH_TYPE_CD String,
  BRANCH_CLASS_CD String,
  CITY String,
  ADDRESS String,
  PHONE String,
  APPROVED Int16,
  ENABLED Int16,
  EXECUTIVE_CITY_ID Int32,
  EXECUTIVE_CITY_NAME String,
  MANAGE_PROVINCE_NAME String,
  EXECUTIVE_PROVINCE_ID Int32,
  EXECUTIVE_PROVINCE_NAME String,
  UNIONPAYTYPE String,
  SYSTEM_FLG String,
  LEND_CHANNEL_ID Int32,
  LAST_UPDATE_DATE DateTime,
  openDate Date,
  region_id Int32,
  region_name String,
  loan_collection_org Int32
) 
PRIMARY KEY GROUP_ID GROUP_NAME
LAYOUT(COMPLEX_KEY_HASHED())
SOURCE(MYSQL(HOST '172.16.2.142' PORT 3309 USER 'diaodu' PASSWORD 'zjKSt0QQrEIMsjm' db 'dim' table 'd_dim_org_inf'))\
LIFETIME(MIN 300 MAX 360)


<?xml version="1.0"?>
<dictionaries>
    <dictionary>
	<name>org_info_dict</name>
	<source>
	<!-- 数据源配置 -->
	    <mysql>
		<port>3309</port>
		<user>diaodu</user>
		<password>zjKSt0QQrEIMsjm</password>
		<replica>
		    <host>172.16.2.142</host>
		    <priority>1</priority>
		</replica>
		<db>dim</db>
		<table>d_dim_org_inf</table>
	    </mysql>
	</source>

        <layout>
        <!-- 在内存中的数据格式类型 -->
	    <complex_key_hashed/>
        </layout>

        <structure>
        <!-- 字典的数据结构 -->
	    <key>
			<attribute>
				<name>GROUP_ID</name>
				<type>UInt64</type>
			</attribute>
			<attribute>
				<name>GROUP_NAME</name>
				<type>String</type>
			</attribute>
	    </key>
	    
	    <attribute>
		<name>STORE_ID</name>
		<type>Int32</type>
		<null_value></null_value>
	    </attribute>
            <attribute>
                <name>STORE_NAME</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>CITY_ID</name>
                <type>Int32</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>CITY_NAME</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>AREA_ID</name>
                <type>Int32</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>AREA_NAME</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>org_id</name>
                <type>Int32</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>org_name</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>BRANCH_NAME</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>branch_id</name>
                <type>Int32</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>BRANCH_TYPE_CD</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>BRANCH_CLASS_CD</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>CITY</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>ADDRESS</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>PHONE</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>APPROVED</name>
                <type>Int16</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>ENABLED</name>
                <type>Int16</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>EXECUTIVE_CITY_ID</name>
                <type>Int32</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>EXECUTIVE_CITY_NAME</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>MANAGE_PROVINCE_NAME</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>EXECUTIVE_PROVINCE_ID</name>
                <type>Int32</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>EXECUTIVE_PROVINCE_NAME</name>
                <type>Int32</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>UNIONPAYTYPE</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>SYSTEM_FLG</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>LEND_CHANNEL_ID</name>
                <type>Int32</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>LAST_UPDATE_DATE</name>
                <type>DateTime</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>openDate</name>
                <type>Date</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>region_id</name>
                <type>Int32</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>region_name</name>
                <type>String</type>
                <null_value></null_value>
            </attribute>
            <attribute>
                <name>loan_collection_org</name>
                <type>Int16</type>
                <null_value></null_value>
            </attribute>

        </structure>

	<lifetime>
	<!-- 字典的自动更新频率 -->
	    <min>300</min>
	    <max>360</max>
	</lifetime>
    </dictionary>
</dictionaries>

