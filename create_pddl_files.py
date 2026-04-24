import os
import sys
import subprocess
import time
#import pm4py





input_path = r"C:\Users\paulw\Downloads\multi-perspective_aligner\src\main\resources\input"
output_path = r"C:\Users\paulw\Downloads\multi-perspective_aligner\src\main\resources\output\pddl"
jar_path = r"C:\Users\paulw\Downloads\multi-perspective_aligner\target\MultiPerspectiveAligner-1.0-SNAPSHOT-launcher.jar"
#cost_model = "cost_model.txt"
variable_values = "variable_values.txt"


#cmd = r'java -jar '


if __name__ == "__main__":

    decl_path = os.path.join(input_path, "declare")
    pn_path = os.path.join(input_path, "petrinet")
    log_path = os.path.join(input_path, "logs")

    decl_f = os.listdir(decl_path)
    pn_f = os.listdir(pn_path)

    decl_f = [f for f in decl_f if f[-4:] == "decl"]
    pn_f = [f for f in pn_f if f[-4:] == "pnml"]

    pns = dict()
    logs = []
    print("Start")

    #if "cost_models" not in os.listdir(input_path):
    #    os.mkdir(os.path.join(input_path, "cost_models"))    
    #    for pn in pn_f:
    #        pm = pm4py.read_pnml(os.path.join(pn_path, pn))
    #        pnname = pn[:-5]
    #        with open(os.path.join(input_path, "cost_models", f"cost_model-{pnname}.txt"), "w+") as f:
    #            f.write("\n".join([t.label+" 1 2 1 2" for t in pm[0].transitions]))

    for p_ in pn_f:

        
        pname = p_[:-5]

        if not (os.path.exists(os.path.join(decl_path, pname))):
            continue
        
        declmods = os.listdir(os.path.join(decl_path, pname))

        # Does log exists?
        #if not (os.path.exists(os.path.join(log_path, f"{pname}.xes"))):
        #    continue   

        for f in declmods:
            
            if f[-4:] != "decl" or ("parsed" not in f):
                continue

            #print(pname, f[-4:])

            var_sub_file = f.split("_parsed")[0]+".decl.txt"
            var_sub_file = f"variable_substitutions_{var_sub_file}"


            decl_loc = f"declare\\{pname}\\{f}"
            #pn_loc = f"petrinet\\{p_}"
            pn_loc = os.path.join(pn_path, p_)
            log_loc = f"logs\\{pname}.xes"
            var_sub_loc = f"variable_subs/{var_sub_file}"

            all_logs = [
                #log_loc,
                f"logs/{pname}-add-1.xes",
                f"logs/{pname}-add-2.xes",
                f"logs/{pname}-add-3.xes",
                f"logs/{pname}-add-5.xes",
                f"logs/{pname}-del-1.xes",
                f"logs/{pname}-del-2.xes",
                f"logs/{pname}-del-3.xes",
                f"logs/{pname}-del-5.xes",
                f"logs/{pname}-change-1.xes",
                f"logs/{pname}-change-2.xes",
                f"logs/{pname}-change-3.xes",
                f"logs/{pname}-change-5.xes",

            ]


            for l in all_logs:
                #new_folder_name = f.replace("_parsed.decl", "").replace("_", "-d")
                
                if (len(l.split("/"))>1):
                    new_folder_name = l.split("/")[1]
                    new_folder_name = (new_folder_name+"-d"+(f.replace("_parsed.decl", "").replace("_", "-d").split("-d")[1])).replace(".xes", "")
                else:
                    new_folder_name = f.replace("_parsed.decl", "").replace("_", "-d")

                new_folder_path = os.path.join(output_path, new_folder_name)
                print(pname, f[-4:], new_folder_path)
                
                if not (os.path.exists(new_folder_path)):
                    os.mkdir(new_folder_path)
                    time.sleep(5)
                else:
                    continue

                cost_model = f"cost_models/cost_model-{pname}.txt"
                
                #String modelString,String traceString,String variablesString,String substitutionsString,String costsString,String petriNetName
                
                subprocess.call(['java', '-jar', jar_path, decl_loc, l, variable_values, var_sub_loc, cost_model, pn_loc])


                #output_path = r"C:\Users\paulw\Desktop\numeric-PDDL_generator\pddl_gen\src\main\resources\output\pddl"

                pddl_files = os.listdir(output_path)

                #pddl_files = [pf for pf in pddl_files if pf[-4:] == "pddl" and "problem" in pf]
                pddl_files = [pf for pf in pddl_files if pf[-4:] == "pddl"]

                [os.rename(os.path.join(output_path, pf), os.path.join(new_folder_path, pf)) for pf in pddl_files]
                

            
            print("-"*100)

        