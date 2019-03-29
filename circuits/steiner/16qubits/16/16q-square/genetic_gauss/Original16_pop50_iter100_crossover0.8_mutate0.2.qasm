// Initial wiring: [0, 5, 15, 9, 13, 4, 14, 6, 2, 10, 7, 12, 3, 11, 8, 1]
// Resulting wiring: [0, 5, 15, 9, 13, 4, 14, 6, 2, 10, 7, 12, 3, 11, 8, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[0];
cx q[3], q[2];
cx q[7], q[5];
cx q[10], q[5];
cx q[5], q[0];
cx q[7], q[3];
cx q[6], q[4];
cx q[13], q[11];
cx q[15], q[13];
cx q[15], q[0];
cx q[13], q[4];
cx q[6], q[9];
cx q[7], q[15];
cx q[4], q[5];
cx q[2], q[12];
