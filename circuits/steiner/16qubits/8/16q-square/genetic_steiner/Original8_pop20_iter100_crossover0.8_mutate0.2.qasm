// Initial wiring: [14, 0, 4, 15, 7, 1, 11, 9, 2, 13, 5, 12, 8, 3, 10, 6]
// Resulting wiring: [14, 0, 4, 15, 7, 1, 11, 9, 2, 13, 5, 12, 8, 3, 10, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[4];
cx q[13], q[12];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[13];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[15];
cx q[8], q[15];
cx q[4], q[11];
