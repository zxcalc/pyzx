// Initial wiring: [11, 7, 12, 3, 8, 5, 4, 6, 15, 10, 0, 1, 14, 2, 13, 9]
// Resulting wiring: [11, 7, 12, 3, 8, 5, 4, 6, 15, 10, 0, 1, 14, 2, 13, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[7], q[0];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[14], q[13];
cx q[14], q[15];
cx q[12], q[13];
