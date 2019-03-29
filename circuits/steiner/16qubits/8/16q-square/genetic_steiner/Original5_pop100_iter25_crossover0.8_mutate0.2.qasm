// Initial wiring: [2, 7, 12, 3, 14, 13, 6, 4, 1, 0, 10, 15, 11, 8, 5, 9]
// Resulting wiring: [2, 7, 12, 3, 14, 13, 6, 4, 1, 0, 10, 15, 11, 8, 5, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[10], q[9];
cx q[15], q[14];
cx q[12], q[13];
cx q[7], q[8];
cx q[0], q[7];
cx q[7], q[8];
