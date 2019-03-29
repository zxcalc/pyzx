// Initial wiring: [10, 12, 11, 5, 7, 6, 3, 2, 9, 8, 14, 15, 4, 13, 0, 1]
// Resulting wiring: [10, 12, 11, 5, 7, 6, 3, 2, 9, 8, 14, 15, 4, 13, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[0];
cx q[11], q[4];
cx q[6], q[5];
cx q[15], q[14];
cx q[13], q[7];
cx q[13], q[10];
cx q[14], q[15];
cx q[8], q[9];
cx q[7], q[13];
cx q[4], q[9];
cx q[2], q[5];
cx q[2], q[3];
cx q[1], q[9];
cx q[2], q[7];
