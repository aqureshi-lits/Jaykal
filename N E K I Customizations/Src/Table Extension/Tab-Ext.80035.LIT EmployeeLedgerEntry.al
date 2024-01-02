tableextension 80035 "LIT EmployeeLedgerEntry" extends "Employee Ledger Entry"


{
    fields
    {
        field(80000; "LIT Remarks"; Text[250])
        {
            Caption = 'Remarks';
            Editable = false;
        }
        field(80001; "LIT Check No."; Code[20])
        {
            Caption = 'Check No.';
            Editable = false;
        }
        field(80002; "LIT Check Date"; Date)
        {
            Caption = 'Check Date';
            Editable = false;
        }

    }

}