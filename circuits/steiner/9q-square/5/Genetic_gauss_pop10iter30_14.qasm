// Initial wiring: [0 1 2 4 7 5 8 6 3]
// Resulting wiring: [0 2 1 4 7 5 8 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[3], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[0];
cx q[0], q[5];
cx q[3], q[8];
