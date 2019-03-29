// Initial wiring: [12, 16, 18, 3, 10, 6, 2, 0, 8, 7, 17, 13, 9, 11, 1, 4, 15, 14, 19, 5]
// Resulting wiring: [12, 16, 18, 3, 10, 6, 2, 0, 8, 7, 17, 13, 9, 11, 1, 4, 15, 14, 19, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[9];
cx q[14], q[5];
cx q[16], q[15];
cx q[16], q[13];
cx q[14], q[15];
cx q[13], q[14];
cx q[12], q[18];
cx q[0], q[1];
