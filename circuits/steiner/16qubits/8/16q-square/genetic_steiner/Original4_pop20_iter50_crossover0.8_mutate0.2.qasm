// Initial wiring: [7, 1, 15, 10, 12, 6, 8, 9, 2, 5, 4, 13, 3, 14, 0, 11]
// Resulting wiring: [7, 1, 15, 10, 12, 6, 8, 9, 2, 5, 4, 13, 3, 14, 0, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[8], q[7];
cx q[10], q[9];
cx q[15], q[14];
cx q[8], q[9];
cx q[9], q[8];
cx q[7], q[8];
cx q[6], q[9];
cx q[9], q[8];
cx q[2], q[3];
