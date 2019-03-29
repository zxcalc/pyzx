// Initial wiring: [1, 6, 10, 2, 3, 14, 0, 11, 9, 7, 4, 15, 5, 13, 8, 12]
// Resulting wiring: [1, 6, 10, 2, 3, 14, 0, 11, 9, 7, 4, 15, 5, 13, 8, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[6];
cx q[11], q[10];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[6];
cx q[0], q[7];
