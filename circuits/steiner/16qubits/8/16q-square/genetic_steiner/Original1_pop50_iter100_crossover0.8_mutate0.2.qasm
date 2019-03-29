// Initial wiring: [7, 5, 4, 15, 13, 9, 2, 0, 11, 1, 12, 8, 10, 3, 14, 6]
// Resulting wiring: [7, 5, 4, 15, 13, 9, 2, 0, 11, 1, 12, 8, 10, 3, 14, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[10], q[5];
cx q[14], q[13];
cx q[14], q[9];
cx q[8], q[15];
cx q[6], q[9];
cx q[9], q[10];
cx q[4], q[5];
