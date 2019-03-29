// Initial wiring: [11, 14, 5, 9, 12, 0, 15, 8, 3, 13, 10, 7, 2, 4, 1, 6]
// Resulting wiring: [11, 14, 5, 9, 12, 0, 15, 8, 3, 13, 10, 7, 2, 4, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[10], q[5];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[15];
cx q[13], q[14];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[14];
cx q[0], q[7];
