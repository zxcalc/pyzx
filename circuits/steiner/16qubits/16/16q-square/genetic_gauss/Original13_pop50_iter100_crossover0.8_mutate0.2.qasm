// Initial wiring: [7, 6, 1, 9, 4, 11, 12, 2, 15, 10, 0, 13, 3, 14, 5, 8]
// Resulting wiring: [7, 6, 1, 9, 4, 11, 12, 2, 15, 10, 0, 13, 3, 14, 5, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[0];
cx q[10], q[9];
cx q[8], q[0];
cx q[7], q[5];
cx q[12], q[3];
cx q[13], q[3];
cx q[12], q[4];
cx q[6], q[13];
cx q[4], q[15];
cx q[3], q[4];
cx q[2], q[5];
cx q[1], q[14];
cx q[4], q[12];
cx q[3], q[8];
