tableextension 80033 "LIT Employee" extends Employee

{
    fields
    {

        field(80000; "No. 2"; Code[30])
        {
            Caption = 'No. 2';

            trigger OnValidate()
            begin

            end;
        }

        field(80001; "Passport Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'iAx.frz.01 13-12-2018';
        }
        field(80002; "Visa Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'iAX.frz.01 13-12-2018';
        }
        field(80003; "Labour Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'iAX.frz.01 13-12-2018';
        }

        /*
        field(50000; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        */
    }
    trigger OnAfterInsert()
    var
        EmployeeName: Text[50];
    begin

    end;

    // trigger OnBeforeModify()

    // begin
    //     //MAQ IAX Added 17-05-2020 START.
    //     IF UserSetup.GET(USERID) THEN
    //         IF UserSetup."Allow Emp Create and Modify" = FALSE THEN BEGIN
    //             ERROR('You do not have permission to modify employee card. Please contact your system administrator...');
    //         END;
    //     //MAQ IAX Added 17-05-2020 END.
    // end;

    trigger OnAfterModify()
    begin

    end;

    // trigger OnBeforeDelete()
    // var
    //     EmpDelete: Label 'You do not have permission to delete employee card. Please contact your system administrator...';
    // begin
    //     IF UserSetup.GET(USERID) THEN
    //         IF UserSetup."Allow Employee Delete/Rename" = FALSE THEN BEGIN
    //             ERROR(EmpDelete);
    //         End;
    // end;

    // trigger OnBeforeRename()
    // begin
    //     IF UserSetup.GET(USERID) THEN
    //         IF UserSetup."Allow Employee Delete/Rename" = FALSE THEN BEGIN
    //             ERROR('You do not have permission to rename employee card. Please contact your system administrator...');
    //         end;
    // end;

    var
        UserSetup: Record 91;
        DimensionValue: Record 349;
        DefaultDim: Record 352;
        HRSetup: Record 5218;
}