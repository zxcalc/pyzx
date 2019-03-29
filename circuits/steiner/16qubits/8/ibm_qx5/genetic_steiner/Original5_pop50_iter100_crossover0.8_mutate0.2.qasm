// Initial wiring: [7, 3, 15, 0, 11, 8, 5, 14, 12, 9, 13, 6, 10, 1, 4, 2]
// Resulting wiring: [7, 3, 15, 0, 11, 8, 5, 14, 12, 9, 13, 6, 10, 1, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[12], q[11];
cx q[12], q[3];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[10];
cx q[13], q[12];
cx q[13], q[14];
cx q[14], q[13];
cx q[4], q[5];
cx q[0], q[15];
cx q[15], q[14];
cx q[14], q[13];
