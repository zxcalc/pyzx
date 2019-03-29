// Initial wiring: [10, 12, 5, 7, 6, 8, 3, 13, 2, 4, 15, 11, 9, 14, 0, 1]
// Resulting wiring: [10, 12, 5, 7, 6, 8, 3, 13, 2, 4, 15, 11, 9, 14, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[14], q[13];
cx q[15], q[8];
cx q[14], q[15];
cx q[10], q[11];
cx q[9], q[10];
cx q[6], q[9];
cx q[9], q[10];
cx q[0], q[7];
