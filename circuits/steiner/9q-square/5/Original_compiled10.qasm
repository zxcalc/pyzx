// Initial wiring: [0 1 2 8 6 5 7 4 3]
// Resulting wiring: [0 3 1 8 7 5 6 2 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[2], q[3];
cx q[2], q[3];
cx q[2], q[3];
cx q[8], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[8], q[3];
cx q[2], q[3];
cx q[8], q[7];
