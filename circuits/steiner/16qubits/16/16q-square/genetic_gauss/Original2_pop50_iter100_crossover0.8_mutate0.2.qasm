// Initial wiring: [5, 15, 14, 11, 6, 12, 4, 8, 7, 9, 10, 3, 2, 1, 13, 0]
// Resulting wiring: [5, 15, 14, 11, 6, 12, 4, 8, 7, 9, 10, 3, 2, 1, 13, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[9], q[0];
cx q[11], q[2];
cx q[11], q[3];
cx q[14], q[7];
cx q[15], q[10];
cx q[12], q[15];
cx q[10], q[12];
cx q[8], q[9];
cx q[6], q[10];
cx q[6], q[8];
cx q[7], q[15];
cx q[12], q[14];
cx q[1], q[5];
cx q[1], q[15];
cx q[3], q[14];
