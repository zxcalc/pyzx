// Initial wiring: [0 1 3 8 4 5 6 7 2]
// Resulting wiring: [0 1 4 8 3 5 6 7 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[1], q[2];
cx q[4], q[5];
