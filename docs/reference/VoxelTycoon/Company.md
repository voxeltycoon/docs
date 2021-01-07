title: Company

# Class Company

Represents a Player Company

Namespace: `VoxelTycoon`

## Constructors

### Company()

Creates new company with default values.

Declaration

```csharp
public Company()
```

### Company(StateBinaryReader)

Creates new company from provided binary reader.

Declaration

```csharp
public Company(StateBinaryReader reader)
```

| Type                                                    | Name     | Description                |
| ------------------------------------------------------- | -------- | -------------------------- |
| [StateBinaryReader](../Serialization/StateBinaryReader) | _reader_ | Reader with company values |

## Properties

### Cheater

Whether the player company has used cheats.

Declaration

```csharp
public bool Cheater { get; set; }
```

| Type | Description              |
| ---- | ------------------------ |
| bool | True if cheats were used |

### Color

The company's color.
Changing it will invoke the `ColorChanged` action.

Declaration

```csharp
public Color Color { get; set; }
```

| Type  | Description   |
| ----- | ------------- |
| Color | Company color |

### ContrastColor

Get's color that's a contract to a company's color.

Declaration

```csharp
public Color ContrastColor { get; }
```

| Type  | Description       |
| ----- | ----------------- |
| Color | Contrasting color |

### Current

Get's current company used in the game.

Declaration

```csharp
public static Company Current { get; }
```

| Type    | Description     |
| ------- | --------------- |
| Company | Current company |

### CurrentBudgetPeriod

Gets company's current budget period.

Declaration

```csharp
public BudgetPeriod CurrentBudgetPeriod { get; private set; }
```

| Type         | Description             |
| ------------ | ----------------------- |
| BudgetPeriod | Company's budget period |

### Headquarters

Company's headquarters building.

Declaration

```csharp
public Headquarters Headquarters { get; internal set; }
```

| Type         | Description                                          |
| ------------ | ---------------------------------------------------- |
| Headquarters | Company's headquarters, probably `null` if not built |

### HeadquartersFlag

Probably indicates whether headquarters were built.

Declaration

```csharp
public bool HeadquartersFlag { get; set; }
```

| Type | Description                            |
| ---- | -------------------------------------- |
| bool | Whether headquarters are built **(?)** |

### Id

Company Id.

Declaration

```csharp
public byte Id { get; set; }
```

| Type | Description           |
| ---- | --------------------- |
| byte | Company's internal Id |

### Loan

Company's current loan.

Declaration

```csharp
public double Loan { get; }
```

| Type   | Description |
| ------ | ----------- |
| double | Loan        |

### LoanCount

Amount of loans currently taken.

Declaration

```csharp
public int LoanCount { get; private set; }
```

| Type | Description     |
| ---- | --------------- |
| int  | Amount of loans |

### LoanInterest

Current loan interest.

Declaration

```csharp
public double LoanInterest { get; private set; }
```

| Type   | Description   |
| ------ | ------------- |
| double | Loan interest |

### LoanStep

How much loan increases each time it's taken.

Declaration

```csharp
public double LoanStep { get; private set; }
```

| Type   | Description                                 |
| ------ | ------------------------------------------- |
| double | Amount of money received when taking a loan |

### MaxLoan

Maximum loan company can take.

Declaration

```csharp
public double MaxLoan { get; }
```

| Type   | Description     |
| ------ | --------------- |
| double | Max loan amount |

### MaxLoanCount

Maximum amount of times company can take a loan.

Declaration

```csharp
public int MaxLoanCount { get; }
```

| Type | Description                     |
| ---- | ------------------------------- |
| int  | How much loans can company take |

### Money

How much money a company has.

Declaration

```csharp
public double Money { get; private set; }
```

| Type   | Description     |
| ------ | --------------- |
| double | Amount of money |

### Name

Company name.
Changing it will invoke the `NameChanged` action.

Declaration

```csharp
public string Name { get; set; }
```

| Type   | Description  |
| ------ | ------------ |
| string | Company name |

### PreviousBudgetPeriod

Company's previous budget period.

Declaration

```csharp
public BudgetPeriod PreviousBudgetPeriod { get; private set; }
```

| Type         | Description            |
| ------------ | ---------------------- |
| BudgetPeriod | Previous budget period |

### Value

Company's value.

Declaration

```csharp
public double Value { get; private set; }
```

| Type   | Description   |
| ------ | ------------- |
| double | Company value |

## Events

### ColorChanged

Action on when company color changes.

Declaration

```csharp
public event Action ColorChanged;
```

| Type   | Description               |
| ------ | ------------------------- |
| Action | ColorChanged event action |

### MoneyChanged

Action on when company money changes.

Declaration

```csharp
public event Action MoneyChanged;
```

| Type   | Description               |
| ------ | ------------------------- |
| Action | MoneyChanged event action |

### NameChanged

Action on when company name changes.

Declaration

```csharp
public event Action NameChanged;
```

| Type   | Description              |
| ------ | ------------------------ |
| Action | NameChanged event action |

## Methods

### AddMoney(double, BudgetItem, bool)

Adds money to the company.

If `value` is negative takes money away from the company.

Declaration

```csharp
public void AddMoney(double value, BudgetItem budgetItem, bool important = true)
```

Parameters

| Type       | Name         | Description            |
| ---------- | ------------ | ---------------------- |
| double     | _value_      | How much money to add  |
| BudgetItem | _budgetItem_ | Category of the income |
| bool       | _important_  | **(?)**                |

### AddRunningCosts(double, BudgetItem)

Adds running costs to the specified category.

Declaration

```csharp
public void AddRunningCosts(double value, BudgetItem budgetItem)
```

Parameters

| Type       | Name         | Description                                |
| ---------- | ------------ | ------------------------------------------ |
| double     | _value_      | How much money to add to the running costs |
| BudgetItem | _budgetItem_ | Category of the costs                      |

### Borrow(int)

Takes a loan.

Declaration

```csharp
public void Borrow(int count)
```

Parameters

| Type | Name    | Description             |
| ---- | ------- | ----------------------- |
| int  | _count_ | Amount of loans to take |

### CanBorrow(int)

Gets whether the company can take a loan.

Declaration

```csharp
public bool CanBorrow(int count)
```

Parameters

| Type | Name    | Description                          |
| ---- | ------- | ------------------------------------ |
| int  | _count_ | How many loans company wants to take |

Returns

| Type | Description                                  |
| ---- | -------------------------------------------- |
| bool | Whether the company can take that much loans |

### CanRepay(int)

Gets whether the company can take a loan.

Declaration

```csharp
public bool CanRepay(int count)
```

Parameters

| Type | Name    | Description                            |
| ---- | ------- | -------------------------------------- |
| int  | _count_ | How many loans company wants to return |

Returns

| Type | Description                                   |
| ---- | --------------------------------------------- |
| bool | Whether the company can repay that much loans |

### HasEnoughMoney(double)

Gets whether the company can afford something.

Declaration

```csharp
public bool HasEnoughMoney(double price)
```

Parameters

| Type   | Name  | Description                     |
| ------ | ----- | ------------------------------- |
| double | price | How much company wants to spend |

Returns

| Type | Description                                   |
| ---- | --------------------------------------------- |
| bool | Whether the company can spend that much money |

### InitializeLoan(int, int, double, double)

Initializes loans for company.

Declaration

```csharp
public void InitializeLoan(int loanCount, int extraLoanCount, double loanStep, double loanInterest)
```

Parameters

| Type   | Name             | Description                 |
| ------ | ---------------- | --------------------------- |
| int    | _loanCount_      | Amount of loans             |
| int    | _extraLoanCount_ | Additional available loans  |
| double | _loanStep_       | Money given/taken each step |
| double | _loanInterest_   | Interest of the loan        |

### Repay(int)

Repays loans.

Declaration

```csharp
public void Repay(int count)
```

Parameters

| Type | Name    | Description              |
| ---- | ------- | ------------------------ |
| int  | _count_ | Amount of loans to repay |
