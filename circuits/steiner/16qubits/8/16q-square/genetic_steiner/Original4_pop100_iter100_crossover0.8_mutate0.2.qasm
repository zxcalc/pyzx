// Initial wiring: [3, 12, 13, 14, 7, 9, 2, 8, 4, 5, 6, 0, 11, 1, 15, 10]
// Resulting wiring: [3, 12, 13, 14, 7, 9, 2, 8, 4, 5, 6, 0, 11, 1, 15, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[7], q[6];
cx q[12], q[11];
cx q[14], q[13];
cx q[14], q[15];
cx q[8], q[9];
cx q[6], q[9];
cx q[5], q[6];
