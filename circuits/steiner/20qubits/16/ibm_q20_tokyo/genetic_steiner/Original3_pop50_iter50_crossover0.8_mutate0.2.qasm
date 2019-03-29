// Initial wiring: [6, 8, 2, 10, 1, 15, 18, 16, 9, 7, 12, 19, 11, 0, 5, 3, 13, 14, 4, 17]
// Resulting wiring: [6, 8, 2, 10, 1, 15, 18, 16, 9, 7, 12, 19, 11, 0, 5, 3, 13, 14, 4, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[3], q[2];
cx q[11], q[9];
cx q[12], q[11];
cx q[11], q[9];
cx q[12], q[6];
cx q[12], q[11];
cx q[13], q[7];
cx q[16], q[15];
cx q[18], q[12];
cx q[12], q[7];
cx q[18], q[17];
cx q[18], q[12];
cx q[19], q[18];
cx q[18], q[11];
cx q[16], q[17];
cx q[13], q[14];
cx q[12], q[13];
cx q[11], q[18];
cx q[18], q[19];
cx q[8], q[11];
cx q[11], q[18];
cx q[5], q[6];
