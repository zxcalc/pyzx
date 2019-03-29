// Initial wiring: [5, 8, 9, 2, 6, 3, 14, 11, 0, 4, 10, 13, 12, 1, 7, 15]
// Resulting wiring: [5, 8, 9, 2, 6, 3, 14, 11, 0, 4, 10, 13, 12, 1, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[4];
cx q[5], q[2];
cx q[10], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[13];
cx q[14], q[15];
cx q[13], q[14];
cx q[10], q[11];
cx q[4], q[11];
cx q[4], q[5];
cx q[3], q[4];
