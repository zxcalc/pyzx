// Initial wiring: [15, 13, 6, 1, 7, 11, 4, 8, 2, 9, 17, 10, 18, 5, 12, 16, 0, 19, 14, 3]
// Resulting wiring: [15, 13, 6, 1, 7, 11, 4, 8, 2, 9, 17, 10, 18, 5, 12, 16, 0, 19, 14, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[7];
cx q[13], q[12];
cx q[13], q[6];
cx q[19], q[18];
cx q[16], q[17];
cx q[11], q[18];
cx q[5], q[14];
cx q[0], q[9];
