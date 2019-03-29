// Initial wiring: [7, 11, 10, 6, 3, 5, 8, 1, 13, 0, 17, 2, 12, 18, 9, 16, 14, 19, 4, 15]
// Resulting wiring: [7, 11, 10, 6, 3, 5, 8, 1, 13, 0, 17, 2, 12, 18, 9, 16, 14, 19, 4, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[9], q[7];
cx q[11], q[9];
cx q[13], q[9];
cx q[18], q[0];
cx q[13], q[18];
cx q[0], q[15];
cx q[2], q[8];
