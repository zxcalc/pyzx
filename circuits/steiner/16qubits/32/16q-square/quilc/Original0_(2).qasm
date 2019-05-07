// EXPECTED_REWIRING [0 1 10 6 4 3 5 7 8 9 14 11 12 2 13 15]
// CURRENT_REWIRING [2 8 10 6 0 14 12 7 13 11 3 5 9 1 4 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
rz(0.59368010174542*pi) q[0];
rx(1.5707963267948966*pi) q[0];
rz(2.958108965734335*pi) q[0];
rx(-1.5707963267948966*pi) q[0];
rz(-2.4741817804854853*pi) q[0];
rz(-1.5707963267948966*pi) q[2];
rx(1.5707963267948966*pi) q[2];
cz q[1], q[2];
rz(1.5707963267948966*pi) q[10];
rx(1.5707963267948966*pi) q[10];
cz q[9], q[10];
rz(-1.784329049938982*pi) q[1];
rx(-1.5707963267948966*pi) q[1];
rz(1.0636030200628972*pi) q[1];
rx(-1.5707963267948966*pi) q[1];
cz q[1], q[0];
rz(-1.5707963267948966*pi) q[0];
rx(1.5707963267948966*pi) q[0];
rz(0.760407881182692*pi) q[1];
rx(-1.5707963267948966*pi) q[1];
cz q[1], q[0];
rx(-1.5707963267948966*pi) q[0];
rx(1.5707963267948966*pi) q[1];
cz q[1], q[0];
rx(-1.5707963267948966*pi) q[2];
rz(1.5707963267948966*pi) q[2];
rz(-0.32745219453483365*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
rz(-1.5707963267948966*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rz(-1.979183293080613*pi) q[5];
rx(1.5707963267948966*pi) q[5];
cz q[4], q[5];
rx(1.5707963267948966*pi) q[4];
rx(-1.5707963267948966*pi) q[5];
cz q[4], q[5];
rz(-2.087802470758894*pi) q[11];
rx(1.5707963267948966*pi) q[11];
rz(1.3844841619731474*pi) q[11];
rx(-1.5707963267948966*pi) q[11];
rz(-2.2762476260936904*pi) q[11];
rz(0.5936801017454187*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(2.958108965734335*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
rz(0.6015542728903499*pi) q[6];
rz(1.3572636036508121*pi) q[9];
rx(1.5707963267948966*pi) q[9];
rz(2.077989633526897*pi) q[9];
rx(-1.5707963267948966*pi) q[9];
cz q[9], q[6];
rz(1.6366529270088535*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(-2.3811847724071016*pi) q[9];
rx(-1.5707963267948966*pi) q[9];
cz q[9], q[6];
rx(-1.5707963267948966*pi) q[6];
rx(1.5707963267948966*pi) q[9];
cz q[9], q[6];
rz(-1.5707963267948966*pi) q[7];
rx(1.5707963267948966*pi) q[7];
rz(1.5707963267948966*pi) q[7];
rz(-1.1645820567151592*pi) q[9];
rx(1.5707963267948966*pi) q[9];
rz(0.16538560610687794*pi) q[9];
rx(-1.5707963267948966*pi) q[9];
rz(2.730367851897572*pi) q[9];
cz q[9], q[14];
rz(-2.967878154599905*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(2.076174076436268*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
rz(0.34773632474327076*pi) q[4];
cz q[11], q[4];
rz(-0.1971251490272814*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(-1.5707963267948966*pi) q[11];
rx(-1.5707963267948966*pi) q[11];
cz q[11], q[4];
rx(-1.5707963267948966*pi) q[4];
rx(1.5707963267948966*pi) q[11];
cz q[11], q[4];
rz(-0.6542456812873576*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(0.9242262418970197*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
cz q[7], q[6];
rz(0.328089979470203*pi) q[8];
rx(-1.5707963267948966*pi) q[8];
rz(0.9297336055948215*pi) q[9];
rx(1.5707963267948966*pi) q[9];
cz q[8], q[9];
rz(-1.5707963267948966*pi) q[8];
rx(-1.5707963267948966*pi) q[8];
rz(3.141592653589793*pi) q[9];
rx(1.5707963267948966*pi) q[9];
cz q[8], q[9];
rz(3.141592653589793*pi) q[8];
rx(1.5707963267948966*pi) q[8];
cz q[8], q[9];
rz(0.10344064106915161*pi) q[3];
rx(1.5707963267948966*pi) q[3];
rz(1.4189783790674746*pi) q[3];
rx(-1.5707963267948966*pi) q[3];
rx(1.5707963267948966*pi) q[4];
cz q[4], q[3];
rz(1.6366529270088535*pi) q[3];
rx(1.5707963267948966*pi) q[3];
rx(-1.5707963267948966*pi) q[4];
cz q[4], q[3];
rx(-1.5707963267948966*pi) q[3];
rx(1.5707963267948966*pi) q[4];
cz q[4], q[3];
rz(-1.1645820567151592*pi) q[11];
rx(1.5707963267948966*pi) q[11];
rz(0.16538560610687794*pi) q[11];
rx(-1.5707963267948966*pi) q[11];
rz(2.730367851897572*pi) q[11];
cz q[11], q[12];
rz(1.9770105968746348*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(2.976207047482916*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
cz q[4], q[11];
rz(-1.7725785159253433*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rz(2.622854369740083*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
rz(2.0998669354853434*pi) q[5];
rz(-1.6742369678640472*pi) q[11];
rx(-1.5707963267948966*pi) q[11];
rz(1.5707963267948966*pi) q[11];
rz(-2.174266210720731*pi) q[12];
rx(1.5707963267948966*pi) q[12];
rz(0.6661515907628791*pi) q[12];
rx(-1.5707963267948966*pi) q[12];
rz(-2.258249439555611*pi) q[13];
rx(1.5707963267948966*pi) q[13];
rz(0.8442794853531403*pi) q[13];
rx(-1.5707963267948966*pi) q[13];
rz(-0.030019585778171987*pi) q[13];
cz q[13], q[12];
rz(-1.078872652364751*pi) q[12];
rx(1.5707963267948966*pi) q[12];
rx(-1.5707963267948966*pi) q[13];
cz q[13], q[12];
rx(-1.5707963267948966*pi) q[12];
rx(1.5707963267948966*pi) q[13];
cz q[13], q[12];
rz(2.5479125518443735*pi) q[7];
rx(1.5707963267948966*pi) q[7];
rz(0.18348368785545807*pi) q[7];
rx(-1.5707963267948966*pi) q[7];
rz(-2.540038380699442*pi) q[7];
rz(1.2467069698080557*pi) q[8];
rx(1.5707963267948966*pi) q[8];
rz(1.0636030200628976*pi) q[8];
rx(-1.5707963267948966*pi) q[8];
rz(0.6050745599683424*pi) q[8];
cz q[8], q[7];
rz(1.6366529270088535*pi) q[7];
rx(1.5707963267948966*pi) q[7];
rz(0.15533332121434995*pi) q[8];
rx(-1.5707963267948966*pi) q[8];
cz q[8], q[7];
rx(-1.5707963267948966*pi) q[7];
rx(1.5707963267948966*pi) q[8];
cz q[8], q[7];
rz(1.5707963267948966*pi) q[14];
rx(1.5707963267948966*pi) q[14];
cz q[14], q[15];
rz(2.260920723849703*pi) q[0];
rx(1.5707963267948966*pi) q[0];
rz(2.2648194359850935*pi) q[0];
rx(-1.5707963267948966*pi) q[0];
rz(-0.713689415289282*pi) q[0];
rx(1.5707963267948966*pi) q[7];
rz(1.5707963267948966*pi) q[7];
rz(0.41122480169222236*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(1.7226142745223192*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
cz q[5], q[4];
rz(-1.5049397265809397*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(-1.5707963267948966*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
cz q[5], q[4];
rx(-1.5707963267948966*pi) q[4];
rx(1.5707963267948966*pi) q[5];
cz q[5], q[4];
rz(2.624586509625793*pi) q[10];
rx(1.5707963267948966*pi) q[10];
rz(1.3844841619731463*pi) q[10];
rx(-1.5707963267948966*pi) q[10];
rz(-2.2762476260936895*pi) q[10];
rx(-1.5707963267948966*pi) q[5];
cz q[10], q[5];
rx(1.5707963267948966*pi) q[5];
rz(-1.5707963267948966*pi) q[10];
rx(-1.5707963267948966*pi) q[10];
cz q[10], q[5];
rx(-1.5707963267948966*pi) q[5];
rx(1.5707963267948966*pi) q[10];
cz q[10], q[5];
rz(2.003614218325528*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(2.077989633526896*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
rz(-0.8103884456122046*pi) q[6];
rx(-1.5707963267948966*pi) q[10];
rz(1.5707963267948966*pi) q[10];
rz(2.211916371404958*pi) q[13];
rx(1.5707963267948966*pi) q[13];
rz(2.531201214919965*pi) q[13];
rx(-1.5707963267948966*pi) q[13];
rz(1.6641803758921994*pi) q[13];
rz(1.4151273532427717*pi) q[9];
rx(1.5707963267948966*pi) q[9];
rz(1.792818118952178*pi) q[9];
rx(-1.5707963267948966*pi) q[9];
rz(-1.5394842355109397*pi) q[9];
cz q[13], q[10];
rz(-1.5707963267948966*pi) q[10];
rx(1.5707963267948966*pi) q[10];
rz(-1.5707963267948966*pi) q[13];
rx(-1.5707963267948966*pi) q[13];
cz q[13], q[10];
rx(-1.5707963267948966*pi) q[10];
rx(1.5707963267948966*pi) q[13];
cz q[13], q[10];
rz(-2.6625757902999436*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(0.8385954038498077*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
rz(2.387104966695441*pi) q[4];
rz(1.9911158794336048*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rz(2.1158967867995226*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
rz(-2.871097935601913*pi) q[5];
rz(-0.7849390772547775*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(2.5452240320644517*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
cz q[5], q[6];
rx(-1.5707963267948966*pi) q[5];
rz(-2.309254894156844*pi) q[6];
rx(1.5707963267948966*pi) q[6];
cz q[5], q[6];
rx(1.5707963267948966*pi) q[5];
rx(-1.5707963267948966*pi) q[6];
cz q[5], q[6];
rz(1.4564375502462914*pi) q[13];
rx(1.5707963267948966*pi) q[13];
rz(1.4269954866939927*pi) q[13];
rx(-1.5707963267948966*pi) q[13];
rz(0.08197635545524956*pi) q[13];
rx(-1.5707963267948966*pi) q[14];
rz(1.5707963267948966*pi) q[14];
rz(-1.164582056715152*pi) q[8];
rx(1.5707963267948966*pi) q[8];
rz(0.16538560610687839*pi) q[8];
rx(-1.5707963267948966*pi) q[8];
rz(1.5707963267948966*pi) q[15];
rx(1.5707963267948966*pi) q[15];
cz q[8], q[15];
rx(1.5707963267948966*pi) q[10];
cz q[10], q[9];
rz(-1.5707963267948966*pi) q[9];
rx(1.5707963267948966*pi) q[9];
rx(-1.5707963267948966*pi) q[10];
cz q[10], q[9];
rx(-1.5707963267948966*pi) q[9];
rx(1.5707963267948966*pi) q[10];
cz q[10], q[9];
rz(-1.1645820567151595*pi) q[10];
rx(1.5707963267948966*pi) q[10];
rz(0.1653856061068779*pi) q[10];
rx(-1.5707963267948966*pi) q[10];
rz(-0.5146654427613733*pi) q[10];
rz(-2.323771496177309*pi) q[12];
rx(1.5707963267948966*pi) q[12];
rz(2.4339007283512615*pi) q[12];
rx(-1.5707963267948966*pi) q[12];
cz q[12], q[11];
cz q[7], q[0];
rz(-1.5707963267948966*pi) q[0];
rx(1.5707963267948966*pi) q[0];
rz(-1.5707963267948966*pi) q[7];
rx(-1.5707963267948966*pi) q[7];
cz q[7], q[0];
rx(-1.5707963267948966*pi) q[0];
rx(1.5707963267948966*pi) q[7];
cz q[7], q[0];
rz(-0.6542456812873576*pi) q[9];
rx(1.5707963267948966*pi) q[9];
rz(0.9242262418970197*pi) q[9];
rx(-1.5707963267948966*pi) q[9];
cz q[9], q[8];
rz(1.5707963267948966*pi) q[11];
rx(1.5707963267948966*pi) q[11];
cz q[11], q[10];
rz(0.4824866245699025*pi) q[12];
rx(1.5707963267948966*pi) q[12];
rz(1.7571084916166462*pi) q[12];
rx(-1.5707963267948966*pi) q[12];
rz(0.8653450274961033*pi) q[12];
rz(1.674236967864048*pi) q[11];
rx(1.5707963267948966*pi) q[11];
rz(1.4189783790674746*pi) q[11];
rx(-1.5707963267948966*pi) q[11];
cz q[12], q[11];
rz(1.6366529270088535*pi) q[11];
rx(1.5707963267948966*pi) q[11];
rz(-1.5707963267948966*pi) q[12];
rx(-1.5707963267948966*pi) q[12];
cz q[12], q[11];
rx(-1.5707963267948966*pi) q[11];
rx(1.5707963267948966*pi) q[12];
cz q[12], q[11];
cz q[13], q[14];
rz(3.141592653589793*pi) q[10];
rz(-1.1645820567151592*pi) q[12];
rx(1.5707963267948966*pi) q[12];
rz(0.16538560610687794*pi) q[12];
rx(-1.5707963267948966*pi) q[12];
rz(2.730367851897572*pi) q[12];
rz(-1.5707963267948966*pi) q[13];
rx(-1.5707963267948966*pi) q[13];
cz q[12], q[13];
rz(-2.495242038915076*pi) q[9];
rz(3.141592653589793*pi) q[13];
rx(1.5707963267948966*pi) q[13];
cz q[13], q[10];
rz(1.5707963267948966*pi) q[13];
rz(3.141592653589793*pi) q[14];
rz(-1.3061944114324846*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(1.9026438019721046*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
rz(2.8150159301298454*pi) q[6];
cz q[9], q[10];
rx(-1.5707963267948966*pi) q[7];
rz(0.8425981608894298*pi) q[8];
rx(1.5707963267948966*pi) q[8];
rz(2.077989633526896*pi) q[8];
rx(-1.5707963267948966*pi) q[8];
rz(-2.3811847724071016*pi) q[8];
cz q[8], q[7];
rx(1.5707963267948966*pi) q[7];
rx(-1.5707963267948966*pi) q[8];
cz q[8], q[7];
rx(-1.5707963267948966*pi) q[7];
rx(1.5707963267948966*pi) q[8];
cz q[8], q[7];
cz q[9], q[6];
rz(0.10344064106915161*pi) q[10];
rx(1.5707963267948966*pi) q[10];
rz(1.4189783790674746*pi) q[10];
rx(-1.5707963267948966*pi) q[10];
rz(-3.075736053375836*pi) q[10];
rz(-0.10969008582078477*pi) q[13];
rx(1.5707963267948966*pi) q[13];
rz(-1.0427480046911755*pi) q[14];
rx(1.5707963267948966*pi) q[14];
cz q[13], q[14];
rx(1.5707963267948966*pi) q[13];
rx(-1.5707963267948966*pi) q[14];
cz q[13], q[14];
rz(1.1421809860185415*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rz(1.9991106195981319*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
rz(2.308530306531245*pi) q[5];
cz q[5], q[4];
rz(-1.5707963267948966*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(2.3557354040496747*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
cz q[5], q[4];
rx(-1.5707963267948966*pi) q[4];
rx(1.5707963267948966*pi) q[5];
cz q[5], q[4];
rz(-0.23282568732648357*pi) q[10];
rx(1.5707963267948966*pi) q[10];
rz(1.0459863956166593*pi) q[10];
rx(-1.5707963267948966*pi) q[10];
rz(-0.8706179904534663*pi) q[10];
rz(0.8048133434677912*pi) q[13];
rx(1.5707963267948966*pi) q[13];
rz(1.5239129404869778*pi) q[13];
rx(-1.5707963267948966*pi) q[13];
cz q[10], q[13];
rx(-1.5707963267948966*pi) q[10];
rz(-1.712794239277683*pi) q[13];
rx(1.5707963267948966*pi) q[13];
cz q[10], q[13];
rx(1.5707963267948966*pi) q[10];
rx(-1.5707963267948966*pi) q[13];
cz q[10], q[13];
rz(-1.1645820567151592*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rz(0.16538560610687794*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
rz(2.730367851897572*pi) q[5];
rz(-0.6823017434199508*pi) q[10];
rx(1.5707963267948966*pi) q[10];
rz(2.4760205532600033*pi) q[10];
rx(-1.5707963267948966*pi) q[10];
rz(1.0021477101876197*pi) q[10];
cz q[10], q[5];
rz(1.3572636036508112*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(2.077989633526896*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
rz(-0.8103884456122045*pi) q[6];
rz(-2.3645799389094107*pi) q[10];
rx(1.5707963267948966*pi) q[10];
rz(1.4189783790674746*pi) q[10];
rx(-1.5707963267948966*pi) q[10];
rz(-3.075736053375836*pi) q[10];
rx(1.5707963267948966*pi) q[11];
rz(1.5707963267948966*pi) q[11];
rz(-2.277884967485033*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rz(1.0937860366825942*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
rz(-1.831754757873842*pi) q[5];
rz(2.040077483822428*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(0.7456431212362478*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
cz q[5], q[6];
rx(-1.5707963267948966*pi) q[5];
rz(-0.42198365321068443*pi) q[6];
rx(1.5707963267948966*pi) q[6];
cz q[5], q[6];
rx(1.5707963267948966*pi) q[5];
rx(-1.5707963267948966*pi) q[6];
cz q[5], q[6];
cz q[11], q[10];
rz(-1.5707963267948966*pi) q[10];
rx(1.5707963267948966*pi) q[10];
rz(-1.5707963267948966*pi) q[11];
rx(-1.5707963267948966*pi) q[11];
cz q[11], q[10];
rx(-1.5707963267948966*pi) q[10];
rx(1.5707963267948966*pi) q[11];
cz q[11], q[10];
rz(0.7516191120273431*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(1.927232236871004*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
rz(3.025441244601935*pi) q[6];
rz(-1.9988980732288055*pi) q[7];
rx(1.5707963267948966*pi) q[7];
rz(1.56036784580241*pi) q[7];
rx(-1.5707963267948966*pi) q[7];
rz(3.0936281367159815*pi) q[7];
rz(-2.6625757902999436*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(0.8385954038498077*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
rz(2.387104966695441*pi) q[4];
rz(2.761369489712264*pi) q[11];
rx(1.5707963267948966*pi) q[11];
rz(1.9641888827222767*pi) q[11];
rx(-1.5707963267948966*pi) q[11];
rz(-0.9438241621069082*pi) q[11];
rz(-2.6625757902999436*pi) q[0];
rx(1.5707963267948966*pi) q[0];
rz(0.8385954038498077*pi) q[0];
rx(-1.5707963267948966*pi) q[0];
rz(2.387104966695441*pi) q[0];
cz q[7], q[6];
rz(-1.5707963267948966*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(-1.5707963267948966*pi) q[7];
rx(-1.5707963267948966*pi) q[7];
cz q[7], q[6];
rx(-1.5707963267948966*pi) q[6];
rx(1.5707963267948966*pi) q[7];
cz q[7], q[6];
cz q[11], q[4];
rz(-1.5707963267948966*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(-1.5707963267948966*pi) q[11];
rx(-1.5707963267948966*pi) q[11];
cz q[11], q[4];
rx(-1.5707963267948966*pi) q[4];
rx(1.5707963267948966*pi) q[11];
cz q[11], q[4];
rz(3.0381520125206416*pi) q[12];
rz(-2.7855626703275247*pi) q[1];
rx(1.5707963267948966*pi) q[1];
rz(1.5624237692186276*pi) q[1];
rx(-1.5707963267948966*pi) q[1];
rz(3.1168379201659304*pi) q[2];
rx(-1.5707963267948966*pi) q[2];
cz q[2], q[1];
rz(1.4056208514322872*pi) q[1];
rx(1.5707963267948966*pi) q[1];
rz(-1.5707963267948966*pi) q[2];
rx(-1.5707963267948966*pi) q[2];
cz q[2], q[1];
rz(3.141592653589793*pi) q[2];
rx(1.5707963267948966*pi) q[2];
cz q[2], q[1];
rx(1.5707963267948966*pi) q[4];
rz(1.5707963267948966*pi) q[4];
rz(-0.4740503008148708*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rz(0.8828222218338312*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
rz(1.8857398482661047*pi) q[5];
rx(1.5707963267948966*pi) q[10];
cz q[10], q[5];
rz(-0.6521871050279446*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rx(-1.5707963267948966*pi) q[10];
cz q[10], q[5];
rx(-1.5707963267948966*pi) q[5];
rx(1.5707963267948966*pi) q[10];
cz q[10], q[5];
rz(1.977010596874633*pi) q[11];
rx(1.5707963267948966*pi) q[11];
rz(2.976207047482916*pi) q[11];
rx(-1.5707963267948966*pi) q[11];
cz q[11], q[12];
rz(-1.5707963267948966*pi) q[1];
rx(1.5707963267948966*pi) q[1];
rz(0.024754733423861808*pi) q[1];
rz(0.46378810492078126*pi) q[2];
rx(1.5707963267948966*pi) q[2];
rz(-0.6542456812873584*pi) q[3];
rx(1.5707963267948966*pi) q[3];
rz(0.9242262418970194*pi) q[3];
rx(-1.5707963267948966*pi) q[3];
cz q[3], q[2];
rz(0.052670512929297586*pi) q[3];
rx(1.5707963267948966*pi) q[3];
rz(0.1834836878554581*pi) q[3];
rx(-1.5707963267948966*pi) q[3];
cz q[4], q[3];
rz(-0.9033854536905883*pi) q[3];
rx(1.5707963267948966*pi) q[3];
rz(-1.5707963267948966*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
cz q[4], q[3];
rx(-1.5707963267948966*pi) q[3];
rx(1.5707963267948966*pi) q[4];
cz q[4], q[3];
rx(1.5707963267948966*pi) q[2];
rz(-2.8988794018581623*pi) q[3];
rx(1.5707963267948966*pi) q[3];
rz(0.8799928159520256*pi) q[3];
rx(-1.5707963267948966*pi) q[3];
cz q[3], q[2];
rz(-1.1645820567151595*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(0.1653856061068779*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
rz(-0.5146654427613733*pi) q[4];
rz(0.8973232807266571*pi) q[3];
rx(1.5707963267948966*pi) q[3];
cz q[3], q[4];
rz(-0.6542456812873576*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(0.9242262418970197*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
rz(-2.495242038915076*pi) q[6];
rz(1.5707963267948966*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(-0.6542456812873576*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rz(0.9242262418970197*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
cz q[4], q[5];
cz q[5], q[6];
rz(1.171614062613372*pi) q[0];
rx(1.5707963267948966*pi) q[0];
rz(1.9429621267826758*pi) q[0];
rx(-1.5707963267948966*pi) q[0];
rz(1.13698197128607*pi) q[7];
rx(1.5707963267948966*pi) q[7];
rz(0.6411616560957474*pi) q[7];
rx(-1.5707963267948966*pi) q[7];
rz(1.7290205928519211*pi) q[7];
cz q[7], q[0];
rz(2.31329655296397*pi) q[0];
rx(1.5707963267948966*pi) q[0];
rx(-1.5707963267948966*pi) q[7];
cz q[7], q[0];
rx(-1.5707963267948966*pi) q[0];
rx(1.5707963267948966*pi) q[7];
cz q[7], q[0];
rz(-2.164476428540317*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(0.1834836878554581*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
rz(-2.5400383806994418*pi) q[4];
rz(-1.137978435264266*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rz(2.0779896335268964*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
cz q[5], q[4];
rz(1.6366529270088535*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(-2.381184772407101*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
cz q[5], q[4];
rx(-1.5707963267948966*pi) q[4];
rx(1.5707963267948966*pi) q[5];
cz q[5], q[4];
rz(0.10344064106915161*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(1.4189783790674746*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
rz(-1.0158529567728853*pi) q[7];
rx(1.5707963267948966*pi) q[7];
rz(2.12662375447585*pi) q[7];
rx(-1.5707963267948966*pi) q[7];
rz(0.8656396437764694*pi) q[7];
cz q[7], q[6];
rz(1.6366529270088535*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(-2.542262946114258*pi) q[7];
rx(-1.5707963267948966*pi) q[7];
cz q[7], q[6];
rx(-1.5707963267948966*pi) q[6];
rx(1.5707963267948966*pi) q[7];
cz q[7], q[6];
cz q[1], q[2];
rz(-1.1645820567151592*pi) q[5];
rx(1.5707963267948966*pi) q[5];
rz(0.16538560610687794*pi) q[5];
rx(-1.5707963267948966*pi) q[5];
rz(2.730367851897572*pi) q[5];
rz(-0.6542456812873576*pi) q[6];
rx(1.5707963267948966*pi) q[6];
rz(0.9242262418970197*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
cz q[6], q[5];
rz(-1.164582056715158*pi) q[10];
rx(1.5707963267948966*pi) q[10];
rz(0.16538560610687766*pi) q[10];
rx(-1.5707963267948966*pi) q[10];
rz(2.0854617695562703*pi) q[11];
rx(1.5707963267948966*pi) q[11];
cz q[10], q[11];
rz(1.59043020718573*pi) q[0];
rx(1.5707963267948966*pi) q[0];
rz(2.330729212640035*pi) q[0];
rx(-1.5707963267948966*pi) q[0];
rz(-2.924865835226325*pi) q[0];
rx(1.5707963267948966*pi) q[2];
rz(1.5707963267948966*pi) q[2];
rx(1.5707963267948966*pi) q[3];
rz(-1.5707963267948966*pi) q[3];
rz(-0.6542456812873576*pi) q[4];
rx(1.5707963267948966*pi) q[4];
rz(0.9242262418970197*pi) q[4];
rx(-1.5707963267948966*pi) q[4];
rz(0.6463506146747173*pi) q[4];
rz(-0.1034406410691524*pi) q[5];
rz(2.217146941469614*pi) q[6];
rx(-1.5707963267948966*pi) q[6];
rz(1.5707963267948966*pi) q[6];
rz(1.4564375502462912*pi) q[7];
rx(1.5707963267948966*pi) q[7];
rz(1.426995486693993*pi) q[7];
rx(-1.5707963267948966*pi) q[7];
rz(-3.059616298134544*pi) q[7];
rz(1.4564375502462918*pi) q[8];
rx(1.5707963267948966*pi) q[8];
rz(1.426995486693993*pi) q[8];
rx(-1.5707963267948966*pi) q[8];
rz(-3.059616298134544*pi) q[8];
rz(-1.5707963267948966*pi) q[9];
rx(-1.5707963267948966*pi) q[9];
rz(1.5707963267948966*pi) q[9];
rz(2.626927210828418*pi) q[10];
rx(1.5707963267948966*pi) q[11];
rz(-1.5707963267948966*pi) q[11];
rz(1.5707963267948966*pi) q[12];
rx(-1.5707963267948966*pi) q[12];
rz(1.5707963267948966*pi) q[12];
rz(1.457361793619033*pi) q[13];
rx(1.5707963267948966*pi) q[13];
rz(1.9597906196869956*pi) q[13];
rx(-1.5707963267948966*pi) q[13];
rz(2.372116218100988*pi) q[13];
rz(3.141592653589793*pi) q[14];
rx(1.5707963267948966*pi) q[14];
rz(1.6804864126156804*pi) q[14];
rx(-1.5707963267948966*pi) q[14];
rz(1.5707963267948966*pi) q[14];
rz(3.141592653589793*pi) q[15];
rx(1.5707963267948966*pi) q[15];
rz(-1.5707963267948966*pi) q[15];