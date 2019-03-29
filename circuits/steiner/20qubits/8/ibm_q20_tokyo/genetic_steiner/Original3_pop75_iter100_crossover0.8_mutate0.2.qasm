// Initial wiring: [15, 12, 16, 11, 17, 6, 13, 18, 9, 4, 2, 3, 8, 14, 19, 1, 0, 5, 7, 10]
// Resulting wiring: [15, 12, 16, 11, 17, 6, 13, 18, 9, 4, 2, 3, 8, 14, 19, 1, 0, 5, 7, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[8], q[2];
cx q[11], q[10];
cx q[19], q[18];
cx q[16], q[17];
cx q[14], q[15];
cx q[13], q[14];
cx q[1], q[8];
