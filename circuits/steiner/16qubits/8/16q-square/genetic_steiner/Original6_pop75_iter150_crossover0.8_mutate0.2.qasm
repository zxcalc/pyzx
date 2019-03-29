// Initial wiring: [1, 3, 7, 4, 10, 15, 8, 5, 12, 11, 6, 0, 14, 2, 13, 9]
// Resulting wiring: [1, 3, 7, 4, 10, 15, 8, 5, 12, 11, 6, 0, 14, 2, 13, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[11], q[4];
cx q[14], q[13];
cx q[14], q[15];
cx q[12], q[13];
cx q[7], q[8];
cx q[4], q[5];
cx q[5], q[10];
