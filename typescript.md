@https://www.typescriptlang.org/docs/handbook/2/template-literal-types.html

### TYPE

interface Props {
    defaultData?: any;
    cancel: () => void;
    onSubmit: FormProps<any>["onSubmit"];
	formProps?: Partial<FormProps<any>>;
	
const widgets: any = rest.widgets ? rest.widgets : {};
const onFormChange = (e: any) => {}
