// Initial wiring: [8, 3, 15, 0, 5, 11, 1, 4, 10, 9, 6, 2, 13, 7, 14, 12]
// Resulting wiring: [8, 3, 15, 0, 5, 11, 1, 4, 10, 9, 6, 2, 13, 7, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[4];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[10];
cx q[13], q[12];
cx q[14], q[9];
cx q[0], q[1];
