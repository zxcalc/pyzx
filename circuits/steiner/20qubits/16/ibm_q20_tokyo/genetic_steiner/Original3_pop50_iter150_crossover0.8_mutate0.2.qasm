// Initial wiring: [12, 6, 15, 1, 3, 13, 9, 18, 8, 2, 10, 5, 19, 11, 14, 7, 16, 0, 4, 17]
// Resulting wiring: [12, 6, 15, 1, 3, 13, 9, 18, 8, 2, 10, 5, 19, 11, 14, 7, 16, 0, 4, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[8], q[1];
cx q[10], q[9];
cx q[13], q[7];
cx q[17], q[16];
cx q[16], q[14];
cx q[17], q[11];
cx q[17], q[16];
cx q[18], q[17];
cx q[17], q[16];
cx q[16], q[14];
cx q[18], q[17];
cx q[19], q[18];
cx q[18], q[12];
cx q[16], q[17];
cx q[13], q[16];
cx q[16], q[17];
cx q[13], q[15];
cx q[12], q[18];
cx q[18], q[19];
cx q[6], q[12];
cx q[12], q[18];
cx q[5], q[14];
cx q[2], q[7];
