// Initial wiring: [3, 9, 1, 10, 8, 6, 7, 0, 11, 5, 14, 2, 4, 15, 13, 12]
// Resulting wiring: [3, 9, 1, 10, 8, 6, 7, 0, 11, 5, 14, 2, 4, 15, 13, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[8], q[7];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[12];
cx q[9], q[10];
cx q[7], q[8];
cx q[8], q[9];
cx q[9], q[10];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[15];
