// Initial wiring: [15, 16, 0, 7, 4, 1, 6, 13, 18, 14, 10, 9, 5, 17, 3, 12, 8, 19, 11, 2]
// Resulting wiring: [15, 16, 0, 7, 4, 1, 6, 13, 18, 14, 10, 9, 5, 17, 3, 12, 8, 19, 11, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[5], q[3];
cx q[18], q[12];
cx q[11], q[12];
cx q[3], q[6];
cx q[1], q[7];
cx q[7], q[13];
cx q[0], q[1];
