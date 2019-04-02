# Query editor

## Tips and shortcuts

### Rename item in query editor

Select value and click ```CRTL + F2``` to rename

### Change selected column

Left and right arrows

### Select multiple items

Selelct item, hold shift and select another item

## Functions to remember

### Home tab

- Use First Rows as Headers
- Append Queries
- Choose Columns
- Remove Rows
  - Remove Deuplicates
- Replace Values
- Manage
    - Delete
    - Duplicate
    - Reference
- Merge Queries
    - Select columns to merge, join type
- Extract

### Transform tab

- Data Type
- Detect Data Type
- Unpivot column
- Split Column

### Add Column Tab

- Index Column
- Duplicate Column
- Custom Column (M language)

### Queries Column

- New Group

### Advanced Editor

- M-language

# Data Modeler

## Modeling Tab

- New Table
- New Column

# Relationship View

- Cardinality
- Cross filter direction
- Active properties (Manage Relationships)

## Schemas

### The Star Schema

#### Fact Table:

- A fact table is a primary table in a dimensional model.
- A Fact Table contains
  - Measurements/facts
  - Foreign key to dimension table 

#### Dimension table:

- A dimension table contains dimensions of a fact.
- They are joined to fact table via a foreign key.
- Dimension tables are de-normalized tables.
- The Dimension Attributes are the various columns in a dimension table
- Dimensions offers descriptive characteristics of the facts with the help of their attributes
- No set limit set for given for number of dimensions
- The dimension can also contain one or more hierarchical relationships 



# Two Languages used in Power BI

|  |  Description | Application Areas | 
--- | --- | --- | --- |
M-Language |  Power Query Formula Language <br> Data transformation | Used in Query editor <br>Prepare your data before you load them into the data model  |  
DAX-Language | Data Analysis Expression Language <br> Analytical data calculation <br> Comparable to Excel Functions| Used in Data Modeler <br> Create formulas for an in-depth analysis in the Data View | 

## M Example - Query Editor (Add Column\Custom Column)

### Add custom column based on two existing columns (with space between them)

```M
[#"Age-Group"]&" "&[Category]
```

## DAX Example - Data Modeler (Modeling\New Column)

```dax
DAX-Test = [Age-Group]&" "&[Category]
```

```dax
DAX-Test = [Age-Group]&" "&[Category]
```

### DAX Formulas Example

#### New Table

```dax
Calendar = CALENDAR(DATE(2014,01,01), DATE(2016,12,31))
```

- Rename first column to Date-Daily

#### New Column

```dax
Month = [Date-Daily].[Month]
```

#### New Column

```dax
Month = [Date-Daily].[Month]
```

# Resources

- [Power BI and Active Directory](https://biinsight.com/power-bi-and-active-directory-for-system-administrators/)
- [DAX Fuction Reference](https://docs.microsoft.com/en-us/dax/dax-function-reference)
- [Learn DAX in 30 Minutes](https://support.office.com/en-ie/article/quickstart-learn-dax-basics-in-30-minutes-51744643-c2a5-436a-bdf6-c895762bec1a)