// Initial wiring: [6, 12, 5, 8, 16, 17, 18, 15, 0, 1, 14, 10, 11, 3, 19, 7, 4, 2, 13, 9]
// Resulting wiring: [6, 12, 5, 8, 16, 17, 18, 15, 0, 1, 14, 10, 11, 3, 19, 7, 4, 2, 13, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[6], q[1];
cx q[16], q[14];
cx q[17], q[13];
cx q[14], q[7];
cx q[19], q[8];
cx q[16], q[18];
cx q[15], q[16];
cx q[14], q[19];
cx q[7], q[11];
cx q[11], q[17];
cx q[9], q[13];
cx q[0], q[4];
cx q[0], q[19];
cx q[0], q[9];
