// Initial wiring: [9, 4, 12, 11, 0, 14, 2, 10, 15, 3, 5, 7, 6, 1, 13, 8]
// Resulting wiring: [9, 4, 12, 11, 0, 14, 2, 10, 15, 3, 5, 7, 6, 1, 13, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[6], q[1];
cx q[11], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[11], q[4];
cx q[11], q[12];
cx q[4], q[5];
cx q[5], q[10];
cx q[3], q[4];
