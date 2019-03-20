// Initial wiring: [0 4 2 8 3 5 6 7 1]
// Resulting wiring: [0 4 2 8 3 5 6 7 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[1], q[4];
cx q[1], q[2];
